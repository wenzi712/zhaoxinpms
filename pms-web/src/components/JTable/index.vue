<template>
    <el-table
        ref="JTable"
        :data="data"
        class="Jcommon-table"
        :height="height"
        :element-loading-text="'加载中'"
        v-bind="$attrs"
        :border="border"
        v-on="$listeners"
    >
        <el-table-column v-if="hasC" type="selection" width="50" align="center" />
        <el-table-column v-if="hasNO" type="index" width="50" label="序号" align="center" />
        <slot></slot>
    </el-table>
</template>

<script>
export default {
    name: 'JTable',
    props: {
        data: {
            type: Array,
            default: () => [],
        },
        columnData: {
            type: Array,
            default: () => [],
        },
        // 序号 默认有
        hasNO: {
            type: Boolean,
            default: true,
        },
        // 多选框 默认无
        hasC: {
            type: Boolean,
            default: false,
        },
        border: {
            type: Boolean,
            default: true,
        },
        height: {
            default: '100%',
        },
    },
    watch: {
        data: {
            handler(val) {
                if (!val) return;
                this.doLayout();
            },
            deep: true,
        },
        columnData: {
            handler(val) {
                if (!val) return;
                this.doLayout();
            },
            deep: true,
        },
    },
    methods: {
        doLayout() {
            setTimeout(() => {
                this.$nextTick(() => {
                    this.$refs.JTable.doLayout();
                });
            }, 100);
        },
    },
};
</script>
