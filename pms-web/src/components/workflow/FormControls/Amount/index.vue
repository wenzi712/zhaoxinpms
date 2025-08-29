<template>
    <div class="fc-amount">
        <el-input-number v-model="innerValue" style="width: 100%" v-bind="$props" v-on="$listeners" @input="handleInput"></el-input-number>
        <div v-if="showChinese" class="explain-text">大写：{{ chinese }}</div>
    </div>
</template>
<script>
import { getAmountChinese } from '@/utils';
export default {
    name: 'FcAmount',
    model: {
        prop: 'value',
        event: 'change',
    },
    props: [
        'value',
        'cmpType',
        'tag',
        'tagIcon',
        'precision',
        'labelWidth',
        'step-strictly',
        'controls',
        'controls-position',
        'regList',
        'changeTag',
        'proCondition',
        'showChinese',
        'formId',
        'renderKey',
        'layout',
    ],
    data() {
        return {
            innerValue: this.value,
        };
    },
    computed: {
        chinese() {
            return this.showChinese ? getAmountChinese(this.innerValue) : '';
        },
    },
    watch: {
        value(val) {
            if (val !== this.innerValue) {
                this.innerValue = val;
            }
        },
    },
    methods: {
        handleInput(val) {
            this.$emit('change', val);
        },
    },
};
</script>
<style lang="stylus" scoped>
.explain-text {
  font-size: 12px;
  color: #aaa;
  line-height: 20px;
}
</style>
