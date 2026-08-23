package §_-o10§
{
   public class §_-B2x§ extends §_-Vd§
   {
      
      public static var §_-oJ§:Object = {};
      
      public function §_-B2x§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-62n§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-oJ§[this.hero.id] = {
            "power":§_-bx§(),
            "doubleCast":this.§_-53U§
         };
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete §_-oJ§[this.hero.id];
      }
   }
}

