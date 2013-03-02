# See https://github.com/airblade/paper_trail/issues/113

module ActiveRecord
  # = Active Record Has Many Through Association
  module Associations
    class HasManyThroughAssociation < HasManyAssociation #:nodoc:
      alias_method :original_delete_records, :delete_records

      def delete_records(records, method)
        method ||= :destroy
        original_delete_records(records, method)
      end
    end
  end
end