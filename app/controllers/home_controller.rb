# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_member_setup!, except: %i[new create doc]
  before_action :authenticate_member!, only: %i[doc]
  def index; end

  def doc; end
end
