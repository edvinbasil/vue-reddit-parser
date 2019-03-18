<template>
  <div id="app" class="container">
  </div>
</template>

<script>

export default {
  name: 'app',
  data() {
    return {
      url: 'https://www.reddit.com/r/PewdiepieSubmissions/.json',
      title: 'Subreddit',
      posts: [],
    };
  },
  mounted() {
    this.fetchReddit(this.url);
  },

  methods: {
    fetchReddit(url) {
      fetch(url)
        .then(res => res.json())
        .then((result) => {
          this.posts = result.data.children;
          this.title = this.posts[0].data.subreddit;
        });
    },
  },
};
</script>

<style lang="scss">
</style>
