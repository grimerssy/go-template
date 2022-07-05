# `/schema`

Database migrations.

Note: migrations are highly encouraged to be numbered and to be revertible.<br>
(i.e. each `up` migration should have a corresponding `down` migration, which does the opposite).<br>
Check out [golang-migrate](https://github.com/golang-migrate/migrate), which has become the go-to tool to create migrations.