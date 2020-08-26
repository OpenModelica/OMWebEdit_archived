describe("load app and create simple model using components in library", () => {
  it("can load app homepage and place components from library onto canvas", () => {
    const dataTransfer = new DataTransfer();
    cy.visit("/")
      .get(".css-nyqbs7 > :nth-child(2)")
      .trigger("dragstart", { dataTransfer })
      .get(".canvas")
      .trigger("drop", { dataTransfer, clientX: 350, clientY: 200 })
      .get(".css-nyqbs7 > :nth-child(3)")
      .trigger("dragstart", { dataTransfer })
      .get(".canvas")
      .trigger("drop", { dataTransfer, clientX: 650, clientY: 200 });
  });
});
