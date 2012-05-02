require "rufus/scheduler"
require "forwardable"

class Scheduler
  extend SingleForwardable

  def self.scheduler
    @scheduler ||= Rufus::Scheduler.start_new
  end

  # treat some rufus methods like they're our own
  def_delegators :scheduler, :in, :every
end