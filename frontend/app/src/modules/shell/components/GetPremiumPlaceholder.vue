<script setup lang="ts">
defineProps<{
  title: string;
  description?: string;
  minimumTier?: string | null;
}>();

const { t } = useI18n({ useScope: 'global' });
</script>

<template>
  <div class="flex flex-col items-center justify-center text-center">
    <div class="pb-6">
      <div class="text-h6 !leading-7 mb-1">
        {{ title }}
      </div>
      <div class="text-rui-text-secondary">
        {{ description || t('premium_placeholder.local_description') }}
      </div>
    </div>
  </div>
</template>
