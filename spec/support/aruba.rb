def start
  @aruba_io_wait_seconds = 0.5
  run_interactive './../../bin/rpc'
end