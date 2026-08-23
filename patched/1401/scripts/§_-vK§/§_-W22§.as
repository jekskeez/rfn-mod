package §_-vK§
{
   public class §_-W22§ extends §_-q4§
   {
      
      public static var §_-43p§:Object = {};
      
      public function §_-W22§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-CX§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-43p§[this.hero.id] = {
            "power":§_-Nu§(),
            "doubleCast":this.§_-41W§
         };
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete §_-43p§[this.hero.id];
      }
   }
}

