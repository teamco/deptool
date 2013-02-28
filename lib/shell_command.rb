module ShellCommand
  require 'open3'

  def system_quietly(*cmd)
    exit_status = nil
    err = nil
    out = nil
    Open3.popen3(*cmd) do |stdin, stdout, stderr, wait_thread|
      err = stderr.gets(nil)
      out = stdout.gets(nil)
      [stdin, stdout, stderr].each { |stream| stream.send('close') }
      exit_status = wait_thread.value
    end
    if exit_status.to_i > 0
      err = err.chomp if err
      raise ShellCommand, err
    elsif out
      return out.chomp
    else
      true
    end
  end

end