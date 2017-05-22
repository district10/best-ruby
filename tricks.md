# Tricks

The majority of these Ruby Tricks were extracted from James Edward Gray II
[talk](https://www.youtube.com/watch?v=aBgnlBoIkVM).

-   [Alphanumeric incrementing](tricks/alphanumeric-incrementing.md) -<

    :   和 C++ 的 next_premutation 类似。

-   [Associative arrays](tricks/associative-arrays.md) -<

    :   assoc array 就是一个 array 里的每个 item 都是 length 为 2 的 array。
        可以看成 key->value 的 assoc pair。

        ```ruby
        array.assoc(key)        # get pair (array) through key
        array.rassoc(value)     # get pair (array) through value
        ```

-   [At exit method](tricks/at-exit-method.md) -<

    :   和 c 语言注册 at_exit 函数类似，不过 ruby 里面可以注册多次，
        执行顺序恰好相反。（最开头注册的，最后才执行。）

        ```ruby
        at_exit do
          puts 'inside at_exit method for the first time'
        end
        ```

        可以看到，at_exit 函数输入一个 block，作为要执行的内容。

-   [Autovivification](tricks/autovivification.md) -<

    :   ```ruby
        vivification
            [,vivifi'keiʃən]
            n. 给与生气；赋予生命；苏醒
        ```

        自动给 hash 加上 value（又是一个 hash）

        ```
        deep = Hash.new { |hash,key| hash[key] = Hash.new(&hash.default_proc) }

        deep[:a][:b][:c][:d] = 42
        p deep
        # Result:
        # {:a=>{:b=>{:c=>{:d=>42}}}}
        ```

-   [Blocks can take blocks](tricks/blocks-can-take-blocks.md) -<

    :   这个不太懂。

-   [Bubbling up thread errors](tricks/bubbling-up-thread-errors.md) -<

    :   这个不太懂。

-   [Case on ranges](tricks/case-on-ranges.md) -<

    :   这个似乎本来就这么用啊……`-Float::INFINITY..20` 和 `65..Float::INFINITY` 这个 range 倒是不错。

-   [Count all objects](tricks/count-all-objects.md) -<

    :   `ObjectSpace.count_objects` 不过打印效果不好，用 `pp` 来打印可以换行。

        pp 是 pretty print 的缩写。文档：[Class: PP (Ruby 1.9.3)](http://ruby-doc.org/stdlib-1.9.3/libdoc/pp/rdoc/PP.html)

        ```
        pp(obj, out=$>, width=79)
        ```

-   [Cycle](tricks/cycle.md) -<

    :   一个 array 变成一个 cycle，然后从里面取出一定长度变成 array。

        用的是 ring = array.cycle, ring.take(length)

-   [Data](tricks/data.md) -<

    :   参考文档：[Mixing code and data in Ruby with DATA and __END__ · Ruby China](https://ruby-china.org/topics/27045)

        在下面的例子中，我使用一个关键字： `__END__`。 所有在 `__END__` 下面的内容
        会被 Ruby 解释器忽略， 更有趣的是，Ruby 提供了一个 IO 对象叫做 `DATA`，
        可以让你读取所有在 `__END__` 下面的内容，就像读取另一个文件一样。

        ```ruby
        DATA.each_line do |line|
          puts line
        end

        __END__
        Doom
        Quake
        Diablo
        ```

-   [Easiest database pstore](tricks/easiest-database-pstore.md)
-   [Easiest database pstore yaml](tricks/easiest-database-pstore-yaml.md)
-   [Enable garbage collector profiler](tricks/enable-garbage-collector-profiler.md)

-   [Enable ruby warnings](tricks/enable-ruby-warnings.md) -<

    :   `$VERBOSE = true`

-   [Fast memoization fibonacci](tricks/fast-memoization-fibonacci.md) -<

    :   ````ruby
        fibonacci = Hash.new{ |numbers,index|
          numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
        }.update(0 => 0, 1 => 1)


        p fibonacci[300]

        # Result:
        # 222232244629420445529739893461909967206666939096499764990979600
        ```

        额……这么叼……

-   [Fetch data](tricks/fetch-data.md) -<

    :   hash.fetch(key, backup_val)

        定义 hash 可以用 `{ :key => value }` 还可以 `{ key: value }`

-   [Get random data](tricks/get-random-data.md)
-   [Head tail](tricks/head-tail.md) -<

    :   ```
        def my_reduce(array)
            head, *tail = array
            return (tail.empty? ? head : (head + my_reduce(tail)))
        end
        ```

        这和 array 的 inject 不是类似么？

        ```
        total = array.inject {|sum,item| sum+item }
        ```

-   [Inject](tricks/inject.md)
-   [Inspecting the source with script lines](tricks/inspecting-the-source-with-script-lines.md)
-   [Iterating over specific types](tricks/iterating-over-specific-types.md)

-   [Lambda your own syntax](tricks/lambda-your-own-syntax.md) -<

    :   就是在 Kernel 这个 module 里面 `alias_method :λ, :lambda` 挺无聊的……

-   [Memoization](tricks/memoization.md)
-   [Print formatted with debug](tricks/print-formatted-with-debug.md)
-   [Ruby debug flag](tricks/ruby-debug-flag.md)

-   [Shortcut variable interpolation](tricks/shortcut-variable-interpolation.md) -<

    :   不需要加“{}”，不过我建议加上，反正没有损失。

        ```ruby
        @instance = :instance
        @@class = :class
        $global = :global

        p "#@instance, #@@class, and #$global variables don't need braces"
        ```

-   [Single instance running](tricks/single-instance-running.md) -<

    :   ```
        DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already running'

        trap('INT', 'EXIT')
        puts 'Running...'
        loop do
          sleep
        end

        __END__
        DO NOT DELETE: used for locking
        ```

        还是用了 `__END__` 和 DATA 的 IO，很神奇的样子。

-   [Smalltalk conditionals](tricks/smalltalk-conditionals.md)

-   [Splat operator](tricks/splat-operator.md) -<

    :   这个就是一般的用法啊……
        这个我倒是没见过：

        ```
        # Two splats (**) convert a hash into an arbitary number of keyword arguments
        # This operator doesn't technically have a name

        arguments = { first: 1, second: 2, third: 3 }
        my_method(**arguments)

        # or:

        arguments = { first: 1, second: 2 }
        my_method(third: 3, **arguments)

        # Are equivalent to:

        my_method(first:1, second:2, third:3)
        ```

-   [Stab operator](tricks/stab-operator.md) -< -<

    :   Stab operator……这个名字醉了。就是 `->` 符号替代“lambda”而已啊……

-   [Struct without assignment](tricks/struct-without-assignment.md) -<

    :   ```
        Struct.new("Name", :first, :last) do
          def full
            "#{first} #{last}"
          end
        end

        franzejr = Struct::Name.new("Franze", "Jr")
        p franzejr.full

        # Result:
        # "Franze Jr"
        ```

-   [Super magic keyword](tricks/super-magic-keyword.md) -<

    :   这里神奇的是直接调用了父类 super 的同名函数。只要
        `super(args)` 就可以，不需要 `super.same_method_name(args)`。

-   [Super magic keyword2](tricks/super-magic-keyword2.md) -<

    :   其实连 `super(args)` 都不用……直接 `super`……

-   [Super magic keyword3](tricks/super-magic-keyword3.md) -<

    :   但如果用了 `super()` 就是说你不传入参数。

-   [Super magic keyword4](tricks/super-magic-keyword4.md) -<

    :   `super(&nil)` 和 `super()` 等价。

        &nil 是一个 nil proc。

-   [Super magic keyword5](tricks/super-magic-keyword5.md) -<

    :   ???

-   [Tail call](tricks/tail-call.md) -<

    :   尾递归。

-   [Trigger irb as needed](tricks/trigger-irb-as-needed.md)
-   [Unfreeze objects with fiddle](tricks/unfreeze-objects-with-fiddle.md)

-   [Unused variable format](tricks/unused-variable-format.md) -<

    :   这个好想没必要……直接 `|name,|` 就可以的……
        不过这个语法 `|name,_,_|` 很像 perl，这里允许重名的 arg。

-   [Variables from a regex](tricks/variables-from-a-regex.md) -<

    :   这个和 ruby 无关……RegExp 都可以 capture 匹配的内容并给一个名字的。

-   [Zip](tricks/zip.md)

-   [Introspecting Block Parameters](tricks/introspecting_block_parameters.md)

-   [How to add uniq value to array](tricks/add_uniq_value_to_array.md) -<

    :   `array |= [2, 4]` 这特么都行……
