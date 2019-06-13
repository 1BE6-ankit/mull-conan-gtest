#include "gtest/gtest.h"
#include "factorial.h"

TEST(FactorialTest, BaseCase) {
    ASSERT_EQ(factorial(1), factorial(0));
}

TEST(FactorialllTest, NaturalCase) {
    ASSERT_EQ(factorial(2), 2);
    ASSERT_EQ(factorial(4), 24);
    ASSERT_EQ(factorial(5), 120);
    ASSERT_EQ(factorial(6), 720);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}