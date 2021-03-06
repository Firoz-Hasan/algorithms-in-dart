import 'package:algorithms/trees/binary_search_tree.dart';
import 'package:algorithms/trees/red_black_tree.dart';
import 'package:test/test.dart';

import 'binary_search_tree_test.dart';

void main() {
  RedBlackTree emptyTree, singleNodeTree, multiNodeTree;
  List<RedBlackTree> treeList;
  setUp(() {
    emptyTree = RedBlackTree();
    singleNodeTree = RedBlackTree.withSingleValue(0);
    multiNodeTree = RedBlackTree.fromList(
        ['m', 'n', 'o', 'l', 'k', 'q', 'p', 'h', 'i', 'a']);
    /*---------------------------------------------
    multiNodeTree: (Black nodes are encircled.)

               ⓛ
             /    \
            i      n
           / \    / \
          ⓗ  ⓚ ⓜ  ⓟ
         /          / \
        a          o   q
    ---------------------------------------------*/

    treeList = [emptyTree, singleNodeTree, multiNodeTree];
  });

  test('Red Black Tree property', () {
    for (var tree in treeList) {
      expect(true, isValidRedBlackTree(tree));
    }
  });

  test('Test empty tree', () {
    expect(emptyTree.isEmpty, isTrue);
    expect(singleNodeTree.isEmpty, isFalse);
    expect(multiNodeTree.isEmpty, isFalse);
  });

  test('Test single node', () {
    expect(singleNodeTree.root.value, equals(0));
    expect(multiNodeTree.root.value, equals('l'));
  });

  test('Nullify', () {
    var test = RedBlackTree.fromList([1, 2, 3]);
    test.nullify();
    expect(test.isEmpty, isTrue);
  });

  test('Check contains', () {
    expect(emptyTree.contains(10), isFalse);
    expect(singleNodeTree.contains(10), isFalse);
    expect(singleNodeTree.contains(0), isTrue);
    expect(multiNodeTree.contains('z'), isFalse);

    for (var i in ['m', 'n', 'o', 'l', 'k', 'q', 'p', 'h', 'i', 'a']) {
      expect(multiNodeTree.contains(i), isTrue);
    }
  });

  group('Traversal', () {
    test('Pre-order', () {
      expect(emptyTree.preOrder(), <int>[]);
      expect(singleNodeTree.preOrder(), <int>[0]);
      expect(multiNodeTree.preOrder(),
          equals(<String>['l', 'i', 'h', 'a', 'k', 'n', 'm', 'p', 'o', 'q']));
    });

    test('Post-order', () {
      expect(emptyTree.postOrder(), <int>[]);
      expect(singleNodeTree.postOrder(), <int>[0]);
      expect(multiNodeTree.postOrder(),
          equals(<String>['a', 'h', 'k', 'i', 'm', 'o', 'q', 'p', 'n', 'l']));
    });

    test('In-order', () {
      expect(emptyTree.inOrder(), <int>[]);
      expect(singleNodeTree.inOrder(), <int>[0]);
      expect(multiNodeTree.inOrder(),
          equals(<String>['a', 'h', 'i', 'k', 'l', 'm', 'n', 'o', 'p', 'q']));
    });
  });

  test('Add node', () {
    var test = RedBlackTree();
    var list = test.inOrder();

    test.add(50);
    expect(
        list
          ..add(50)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(60);
    expect(
        list
          ..add(60)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(70);
    expect(
        list
          ..add(70)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(40);
    expect(
        list
          ..add(40)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(55);
    expect(
        list
          ..add(55)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(75);
    expect(
        list
          ..add(75)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(53);
    expect(
        list
          ..add(53)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(54);
    expect(
        list
          ..add(54)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(30);
    expect(
        list
          ..add(30)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(45);
    expect(
        list
          ..add(45)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(35);
    expect(
        list
          ..add(35)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));

    test.add(51);
    expect(
        list
          ..add(51)
          ..sort(),
        test.inOrder());
    expect(true, isValidRedBlackTree(test));
  });

  test('Delete node', () {
    var list = multiNodeTree.inOrder();

    multiNodeTree.delete('m');
    expect(list..remove('m'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('p');
    expect(list..remove('p'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('l');
    expect(list..remove('l'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('o');
    expect(list..remove('o'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('q');
    expect(list..remove('q'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('a');
    expect(list..remove('a'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('k');
    expect(list..remove('k'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('h');
    expect(list..remove('h'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('n');
    expect(list..remove('n'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));

    multiNodeTree.delete('i');
    expect(list..remove('i'), multiNodeTree.inOrder());
    expect(true, isValidRedBlackTree(multiNodeTree));
  });
}

/// Checks if [tree] is a valid Red Black Tree or not.
///
/// Valid Red Black Tree must be a valid Binary Search tree,
///  it's root and leaf([nil]) nodes must be black,
///  all red nodes must have black children and
///  every path from a given node to any of its descendant [nil] nodes goes
///   through the same number of black nodes.
bool isValidRedBlackTree<T extends Comparable>(RedBlackTree tree) {
  if (tree == null || tree.isEmpty) return true;

  var test = BinarySearchTree.withSingleValue(tree.root.value);
  createBinarySearchTree(test.root, tree.preOrder(), tree.inOrder());
  expect(true, isValidBinarySearchTree(test));

  // Root must be black.
  if (tree.root.color != Color.black) return false;

  return _blackNodeCount(tree.root.left) == _blackNodeCount(tree.root.right);
}

int _blackNodeCount(RedBlackNode node) {
  if (node == nil) return 0;

  // Red node must have black children.
  expect(
      true,
      node.color == Color.red
          ? node.left.color == Color.black && node.right.color == Color.black
          : true);

  // Both left and right paths must have same number of black nodes.
  var leftCount = _blackNodeCount(node.left);
  var rightCount = _blackNodeCount(node.right);
  expect(true, leftCount == rightCount);

  // Add node to the count if it is black.
  return node.color == Color.black ? ++leftCount : leftCount;
}
