from faker import Faker

class FakerLibrary:
    def __init__(self):
        self.faker = Faker()

    def email(self):
        return self.faker.email()
