// Import the dependencies for testing
const chai = require("chai");
const chaiHttp = require("chai-http");
const app = require("../");
chai.use(chaiHttp);
chai.should();
describe("Hello World", () => {
    describe("GET /", () => {
        it("should get \"Hello World!\" response", (done) => {
             chai.request(app)
                 .get('/')
                 .end((err, res) => {
                     res.should.have.status(200);
                     res.text.should.be.a('string');
                     res.text.should.be.equal("Hello World!")
                     done();
                  });
         });
    });
});