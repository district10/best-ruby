# Idiomatic Ruby

-   [Each vs map](idiomatic_ruby/each_vs_map.md) -<

    :   显然 map 好。

        ```
        user_ids = users.map { |user| user.id }
        user_ids = users.map(&:id)
        ```

        .map 或者 .collect。

-   [Conditional assignment](idiomatic_ruby/conditional_assignment.md) -<

    :   如果 true/false，用 `? :` 如果更多选择，用 case when。

-   [Combine operation over collections (enumerables)](idiomatic_ruby/combine_elements_in_collection.md) -<

    :   -   Combine elements with reduce: `values.reduce(:*)`
        -   inject

            ```
            values.inject({}) do |hash, value|
                  hash.merge(value => value ** 2)
            end
            # => { 1 => 1, 2 => 4, 3 => 9, 4 => 16 }
            ```

-   [Array of Strings or Symbols](idiomatic_ruby/array_of_strings_symbols.md) -<

    :   -   `%w` array of words
        -   `%i` array of symbols

-   [Multiple Assignment](idiomatic_ruby/multiple_assignment.md) -<

    :   没啥好说的。

-   [Use Symbol to_proc](idiomatic_ruby/use_symbol_to_proc.md) -<

    :   The `&` calls to_procon the object, and passes it as a block to the
        method. The following calls are equivalent:

        ```
        %w(jonh mary michael).map { |x| x.upcase }
        #=> ["JONH", "MARY", "MICHAEL"]

        %w(jonh mary michael).map(&:upcase)
        #=> ["JONH", "MARY", "MICHAEL"]
        ```

-   [Array Sample (enumerables)](idiomatic_ruby/array_sample.md) -<

    :   -   array[rand(length)]
        -   array.shuffle.first
        -   array.sample 最快

-   [Use Fixnum#times](idiomatic_ruby/use_times.md) -<

    :   -   Fixnum.times 更快点。

-   [Implicit Return](idiomatic_ruby/implicit_return.md) -<

    :   不 return 是美德。

-   [Collect vs Select](idiomatic_ruby/collect_vs_select.md) -<

    :   这里其实不用解释的。

        -   collect 是 map
        -   select 是 filter

-   [Options Hash with Defaults](idiomatic_ruby/options_hash_with_defaults.md) -<

    :   这个在 js 里面也常见。

        ```
        def create_user(options = {})
          user_options = { name: 'user', avatar: 'default.png'}.merge!(options)
        end

        p create_user
        #=> { name: 'user', avatar: 'default.png'}

        p create_user name: 'Adam'
        #=> { name: 'Adam', avatar: 'default.png'}

        p create_user name: 'Salma', avatar: 'special.png'
        #=> { name: 'Salma', avatar: 'special.png'}
        ```
