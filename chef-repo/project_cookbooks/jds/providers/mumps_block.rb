#
# Cookbook Name:: cache
# Resource:: mumps_block
#
# This provider uses greenletters and PTY to automate install prompts. This can cause odd character output to :log.
#

action :nothing do
end

action :execute do
  chef_gem "greenletters"
  require "greenletters"

  if node[:jds][:install_cache] == true

    ruby_block "mumps_block:execute:#{new_resource.command.hash}" do
      block do
        shell = Greenletters::Process.new(node[:jds][:shell], :transcript => new_resource.log, :timeout => node[:jds][:shell_timeout_seconds])

        # start the shell
        shell.start!

        # Start Cache session
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write("#{node[:jds][:session]}\r")
        end

        # Login
        if new_resource.cache_username != nil
          shell.wait_for(:output, /Username/) do | process, match |
            process.write("#{new_resource.cache_username}\r")
          end
        end

        if new_resource.cache_password != nil
          shell.wait_for(:output, /Password/) do | process, match |
            process.write("#{new_resource.cache_password}\r")
          end
        end

        # Change namespace
        shell.wait_for(:output, /USER>/) do | process, match |
          process.write("ZN \"#{new_resource.namespace}\"\r")
        end

        prompt = /#{new_resource.namespace}>/
        new_resource.command.each do |resource_command|
          shell.wait_for(:output, prompt) do | process, match |
            process.write(resource_command)
            process.write("\r")
          end
        end

        shell.wait_for(:output, prompt) do | process, match |
          process.write("h\r")
        end
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write("exit\r")
        end
        shell.wait_for(:exit)
      end
    end
  end

  if node[:jds][:install_cache] == false
    ruby_block "mumps_block:execute:#{new_resource.command.hash}" do
      block do
        shell = Greenletters::Process.new(node[:jds][:shell], :transcript => new_resource.log, :timeout => node[:jds][:shell_timeout_seconds])

        # start the shell
        shell.start!

        # cd to where db is located
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write("cd #{node[:jds][:gtm_jds_install_dir]}\r")
        end

        # Source env
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write(". ./myenv.jds\r")
        end

        # Run GT.M
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write("mumps -dir\r")
        end
        
        # Run Commands
        prompt = /#{node[:jds][:gtm_db_name]}>/
        new_resource.command.each do |resource_command|
          shell.wait_for(:output, prompt) do | process, match |
            process.write(resource_command)
            process.write("\r")
          end
        end
        shell.wait_for(:output, prompt) do | process, match |
          process.write("h\n")
        end
        shell.wait_for(:output, node[:jds][:shell_prompt]) do | process, match |
          process.write("exit\n")
        end
        shell.wait_for(:exit)
      end
    end
  end
end
