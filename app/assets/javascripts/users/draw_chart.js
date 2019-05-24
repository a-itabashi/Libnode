$(function () {
  draw_chart("upvote-chart", gon.upvote_datas, gon.upvote_categories)
  draw_chart("borrowed-chart", gon.borrowed_datas, gon.borrowed_categories)
})

function draw_chart(target, data, categories) {
  let ctx = document.getElementById(target).getContext('2d');
  let myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      datasets: [{
        data: data,
      }],
      labels: categories
    },
  });
};
