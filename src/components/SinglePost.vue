<template>
    <div class="media m-3">
      <img :src="post.data.thumbnail" class="mr-3" alt="">
      <div class="media-body">
        <a :href="makeLink(post.data.permalink)" target="_blank" rel="noreferrer noopener">
          <h5 class="mt-0">{{ post.data.title }}</h5>
        </a>
        <div class="badge badge-danger">{{ post.data.ups }} &#x2B06;</div>
        <div class="badge badge-warning">{{ post.data.subreddit_name_prefixed }}</div>
        <div class="badge badge-info">u/{{ post.data.author }}</div>
        <div class="badge">{{ post.data.num_comments }} comments</div>
        <button style="display: block" class="btn btn-dark btn-sm">Link</button>
        <div> {{ post.data.selftext }}</div>
      </div>
    </div>
</template>


<script>
export default {
  name: 'SinglePost',
  props: ['post'],
  methods: {
    makeLink(perm) {
      return `https://www.reddit.com${perm}`;
    },
  },
};
</script>

<style scoped lang="scss">
  .badge {
    margin: 2px;
  }
</style>
