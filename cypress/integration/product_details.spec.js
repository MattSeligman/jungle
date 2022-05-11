describe("Product Details tests", () => {

  beforeEach(() => {
    cy.visit("/");
  });

  it("Selectable first product", () => {
    cy.get("body > main > section > div > article:nth-child(1)")
      .should("be.visible")
      .click()
  });

  it("First product's name should be", () => {
    cy.get("body > main > section > div > article:nth-child(1)")
      .should("be.visible")
      .click()

    cy.get("body > main > section > article > div > h1")
      .should("be.visible")
      .contains("Scented Blade")
    
    cy.get("body > main > section > article > div > p")
      .contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.")
  });

});