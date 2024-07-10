# duckrouter_example

This project investigates the possibilities of the duck_router package.

## Known limitations

- Edge case: When navigating to a page already in the stack, an error is thrown. So you need to check manually if it already exists, and then decide to either pop or navigate.
- Not possible to pop until a certain page. This can be solved with having the page to pop to being a StatefulLocation, and calling root() from the child page.
- NavigatorObservers are not supported. Instead, the onNavigate callback can be used to call these observers manually (however losing the didPopRoute method).

## Conclusion

I really like the simplicity of the package! It stays true to the underlying implementation, and its simplicity makes it easy to follow. 

I did not find any scenarios that were not possible to resolve with the supplied functionality. There is only 1 way to use the package, which makes it a breeze compared to auto_route or go_router.