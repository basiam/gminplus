class Interest < ActiveRecord::Base
  attr_accessible :email, :ip, :zameldowanie, :zamieszkanie, :zamieszkanie_id, :zameldowanie_id, :zamieszkania_id, :zameldowania_id
  belongs_to :gmina_zamieszkania, :foreign_key => :zamieszkania_id, :class_name => Commune
  belongs_to :gmina_zameldowania, :foreign_key => :zameldowania_id, :class_name => Commune
end
