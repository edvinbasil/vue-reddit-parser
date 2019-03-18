<template>
  <div id="app" class="container">
    <h1>{{ title }}</h1>
    <main>
      <div v-for="post in posts" class="media m-3" :key="post.data.id">
        <img :src="post.data.thumbnail" class="mr-3" alt="">
        <div class="media-body">
          <a :href="makeLink(post.data.permalink)" target="_blank" rel="noreferrer noopener">
            <h5 class="mt-0">{{ post.data.title }}</h5>
          </a>
          <div class="badge badge-danger">{{ post.data.ups }} &#x2B06;</div>
          <div> {{ post.data.selftext }}</div>
        </div>
      </div>
    </main>
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
    makeLink(perm) {
      return `https://www.reddit.com${perm}`;
    },
  },
};
</script>

<style lang="scss">
</style>
