_ = require('wegweg')({
  globals: off
})

if !module.parent
  process.env.MONGOOSE_MODEL_DEVEL = module.filename
  process.env.SILENCE = 1
  require './../core/globals'

Schema = mongoose.Schema
models = require './../core/models'

LinksSchema = new Schema {

  active: {
    type: Boolean
    default: yes
  }

  url: {
    type: String
    trim: yes
    required: yes
  }

}, {collection:'links'}

LinksSchema.plugin models.base

##
model = mongoose.model 'Links', LinksSchema

model.AUTO_EXPOSE = {
  route: '/links'
  methods: [

  ]
}

module.exports = model


