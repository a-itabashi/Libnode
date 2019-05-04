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
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
        ]
      }],
      labels: categories
    },
  });
};
