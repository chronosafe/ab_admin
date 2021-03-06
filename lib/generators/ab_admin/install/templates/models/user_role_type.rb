class UserRoleType < AbAdmin::Models::TypeModel
  self.codes = [:default, :redactor, :moderator, :admin]
  self.i18n_scope = [:admin, :user, :role]

  define_enum_by_codes
end
