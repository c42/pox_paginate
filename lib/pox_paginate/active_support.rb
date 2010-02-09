module PoxPaginate
  module ActiveSupport
  end
end

require "#{PoxPaginate::Root}/pox_paginate/active_support/core_hash_ext"

ActiveSupport::CoreExtensions::Hash::Conversions::ClassMethods.send :include, PoxPaginate::ActiveSupport::CoreHashExt
