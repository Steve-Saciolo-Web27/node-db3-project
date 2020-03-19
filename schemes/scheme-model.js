const db = require('../data/db-config')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}

function find() {
  return db('schemes')
}

function findById(id) {
  return db('schemes')
    .where({ id })
    .first()
}

function findSteps(id) {
  return db('steps')
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .select('steps.step_number', 'steps.instructions', 'schemes.scheme_name')
    .where('scheme_id', id)
    .orderBy('steps.step_number')
}

function add(scheme) {
  return db('schemes')
    .insert(scheme)
    .then(newScheme => {
      return findById(newScheme[0])
    })
}

function addStep(step, id) {
  return db('steps').insert({ ...step, scheme_id: id })
}

function update(changes, id) {
  return db('schemes')
    .where({ id })
    .update(changes)
    .then(res => {
      return findById(id)
    })
}

function remove(id) {
  return db('schemes')
    .where({ id })
    .del()
}
