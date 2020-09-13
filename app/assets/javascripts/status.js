$(document).on('turbolinks:load', ()=> {
  const buildSubmitBtn = ()=> {
    const html = `<input type="submit" name="commit" value="割り振る" data-disable-with="割り振る">`;

    return html;
  }

  function status_value () {
    const heart = Number($('#status_heart').val());
    const attack = Number($('#status_attack').val());
    const defense = Number($('#status_defense').val());
    const upper = Number($('#total-points').text());
    let sum = 0;

    if (heart) {
      sum = sum + heart;
    }
    else {
      // do nothing
    }

    if (attack) {
      sum = sum + attack;
    }
    else {
      // do nothing
    }

    if (defense) {
      sum = sum + defense;
    }
    else {
      // do nothing
    }

    const surplus = upper - sum;

    if (surplus < 0) {
      $('.status__surplus').text(`割り振りできる上限値を超えています`);
      $('input[value="割り振る"]').remove();
    }
    else {
      $('.status__surplus').text(`残り${surplus}pt割り振りできます`);
      $('input[value="割り振る"]').remove();
      $('.status__submit-btn').append(buildSubmitBtn());
    }
  }

  status_value();

  $('#status_heart').on('keyup change', function() {
    status_value();
  });

  $('#status_attack').on('keyup change', function() {
    status_value();
  });

  $('#status_defense').on('keyup change', function() {
    status_value();
  });
});
