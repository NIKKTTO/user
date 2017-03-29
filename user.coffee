@Schema ?= {}

Schema.userProfile = new SimpleSchema
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
  couponCode:
    type: String
    optional: true
  name:
    type: String
    optional: true
  address1:
    type: String
    optional: true
  address2:
    type: String
    optional: true
  phone:
    label: 'Phone number'
    type: String
    regEx: /[0-9 ]*/
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
  billing:
    blackbox: true
    optional: true
    type: Object

Schema.userEmail = new SimpleSchema
  address:
    label: 'Email'
    regEx: SimpleSchema.RegEx.Email
    type: String
  verified:
    type: Boolean
    optional: true
  invalid:
    type: Boolean
    optional: true

Schema.user = new SimpleSchema
  _id:
    type: String
    optional: true
  cards:
    defaultValue: []
    type: [Object]
    blackbox: true
  stripeCharges:
    type: [String]
    optional: true
  stripeProcessing:
    type: Date
    optional: true
  subscriptionId:
    type: String
    optional: true
  stripeId:
    type: String
    optional: true
  emails:
    type: [Schema.userEmail]
    optional: true
  createdAt:
    type: Date
  profile:
    optional: true
    type: Schema.userProfile
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
  restricted:
    type: Boolean
    optional: true
  lineQueuedAt:
    type: Date
    optional: true
  linePosition:
    type: Number
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
