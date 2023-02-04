#[
  boxedcat - an okzyrox experimental project

  2022-2023

  applet handler util funcs and defs
]#

type Applet = ref object of RootObj ## applet handler object to be interprepted as
    name:string
    id:int
    aType:string


func AppletReturnId(self:Applet):int = return self.id
func AppletReturnName(self:Applet):string = return self.name
func AppletReturnTypeString(self:Applet):string = return self.aType

