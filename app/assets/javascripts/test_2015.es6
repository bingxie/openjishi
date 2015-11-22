class Person {
  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  get name() {
    return `${this.firstName} ${this.lastName}`;
  }

  set name(name) {
    [this.firstName, this.lastName] = name.split(" ");
  }
}

let blake = new Person("Blake", "Williams");
blake.name = "Blake Anderson";

console.log(blake.name);
