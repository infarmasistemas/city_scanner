class ApplicationService
  def self.method_missing(*args)
    new(*args[1..args.size]).public_send(args.first)
  end
end