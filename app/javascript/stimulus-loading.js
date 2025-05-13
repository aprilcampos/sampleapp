export function definitionsFromContext(context) {
  return Object.values(context).map(module => module.default)
}
