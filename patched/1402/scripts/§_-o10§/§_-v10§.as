package §_-o10§
{
   public class §_-v10§ extends §_-Vd§
   {
      
      private static const §_-a1F§:int = 30000;
      
      public static var §_-73u§:Object = {};
      
      public function §_-v10§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-Yf§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-73u§[this.hero.id] = {"weight":§_-bx§()};
         if(this.§_-53U§)
         {
            §_-73u§[this.hero.id]["lifeTime"] = §_-a1F§;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete §_-73u§[this.hero.id];
      }
   }
}

