# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

liability_product = Product.create!(
  key: 'liability'
)

liability_product_generation_1 = ProductGeneration.create!(
  product: liability_product,
  key: 'liability_1',
  configuration_schema: {
    'age': {
      'description': 'Age of the insured person in years at the start of the contract.',
      'type': 'integer',
      'minimum': 18
    }
  },
  price_calculator: 'PricingCalculator::Liability::One'
)

liability_product_generation_2 = ProductGeneration.create!(
  product: liability_product,
  key: 'liability_2',
  configuration_schema: {
    'age': {
      'description': 'Age of the insured person in years at the start of the contract.',
      'type': 'integer',
      'minimum': 18
    },
    'zip_code': {
      'description': 'The ZIP code of the main address of the insured person.'
      'type': 'string',
      'minLength': 5,
      'maxLength': 5
    }
  },
  price_calculator: 'PricingCalculator::Liability::Two'
)

household_product = Product.create!(
  key: 'household'
)

household_product_generation_2 = ProductGeneration.create!(
  product: liability_product,
  key: 'household_1',
  configuration_schema: {
    'living_space': {
      'description': 'Living space of the insured object in square meters.',
      'type': 'integer',
      'minimum': 1
    },
    'zip_code': {
      'description': 'The ZIP code of the insured objects\' address.'
      'type': 'string',
      'minLength': 5,
      'maxLength': 5
    }
  },
  price_calculator: 'PricingCalculator::Household::One'
)
