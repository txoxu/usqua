# frozen_string_literal: true

# ApplicationRecordはすべてのmodelのベースクラス
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
