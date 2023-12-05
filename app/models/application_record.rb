# frozen_string_literal: true

# The ApplicationRecord class is the base class for all models in the application.
# It inherits from ActiveRecord::Base and includes common functionalities
# shared among all models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
