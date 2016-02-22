@Schema ?= {}

UserProfileSchema = new SimpleSchema
  firstName:
    type: String
    min: 2
    max: 25
    optional: true
  lastName:
    type: String
    min: 2
    max: 25
    optional: true
  name:
    type: String
    optional: true
  phone:
    type: String
    optional: true
  terms:
    type: Boolean
    optional: true
  image:
    type: String
    optional: true
  upgraded:
    type: Date
    optional: true


UserEmailSchema = new SimpleSchema
  address:
    label: 'Email'
    regEx: SimpleSchema.RegEx.Email
    type: String
  verified:
    type: Boolean
    optional: true

Schema.user = new SimpleSchema
  _id:
    type: String
    optional: true
  stripeCharges:
    type: [String]
    optional: true
  stripeProcessing:
    type: Boolean
    optional: true
  stripeId:
    type: String
    optional: true
  emails:
    type: [UserEmailSchema]
    optional: true
  createdAt:
    type: Date
  profile:
    optional: true
    type: UserProfileSchema
  roles:
    type: [String]
    optional: true
  services:
    type: Object
    optional: true
    blackbox: true
  referrer:
    type: String
    optional: true
  nReferrals:
    type: Number
    optional: true
  referrals:
    type: [String]
    optional: true
  nReferralsPaid:
    type: Number
    optional: true
  referralsPaid:
    type: [String]
    optional: true
  source:
    type: String
    optional: true
  username:
    type: String
    optional: true
  hidden:
    type: Boolean
    optional: true
  text:
    type: String
    optional: true

Meteor.users.attachSchema Schema.user