$ ->
  $("#add-more-speciality").on "click", ->
    lastRow = $('#specialities-fields div:last');
    newRow = lastRow.clone();
    newRow.find("input").val("");
    index = new Date().getTime();
    inputs = newRow.find("input");
    return if inputs.length == 0;

    for i in [0...inputs.length]
      newName = $(inputs[i]).attr("name").replace(/[0-9]+/, index);
      $(inputs[i]).attr("name", newName);

    newRow.insertAfter(lastRow);

  $("#add-more-skill").on "click", ->
    lastRow = $('#skills-fields div:last');
    newRow = lastRow.clone();
    newRow.find("input").val("");
    index = new Date().getTime();
    inputs = newRow.find("input");
    return if inputs.length == 0;

    for i in [0...inputs.length]
      newName = $(inputs[i]).attr("name").replace(/[0-9]+/, index);
      $(inputs[i]).attr("name", newName);

    newRow.insertAfter(lastRow);

  $("#add-more-language").on "click", ->
    lastRow = $('#languages-fields div:last');
    newRow = lastRow.clone();
    newRow.find("input").val("");
    index = new Date().getTime();
    inputs = newRow.find("input");
    return if inputs.length == 0;

    for i in [0...inputs.length]
      newName = $(inputs[i]).attr("name").replace(/[0-9]+/, index);
      $(inputs[i]).attr("name", newName);

    newRow.insertAfter(lastRow);
