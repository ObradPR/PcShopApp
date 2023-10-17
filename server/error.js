class ValidationError extends Error {
  constructor(message, status) {
    super(message);
    this.name = "ValidationError";
    this.status = status || 400;
  }
}
class MissingFiledsError extends Error {
  constructor(message, status) {
    super(message);
    this.name = "MissingFiledsError";
    this.status = status || 400;
  }
}
class ValueExistsInDatabaseError extends Error {
  constructor(message, status) {
    super(message);
    this.name = "ValueExistsInDatabaseError";
    this.status = status || 400;
  }
}

class ValueDoesntExistsInDatabaseError extends Error {
  constructor(message, status) {
    super(message);
    this.name = "ValueDoesntExistsInDatabaseError";
    this.status = status || 400;
  }
}

module.exports = {
  ValidationError,
  MissingFiledsError,
  ValueExistsInDatabaseError,
  ValueDoesntExistsInDatabaseError,
};
