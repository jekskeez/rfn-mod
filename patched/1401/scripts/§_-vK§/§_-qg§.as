package §_-vK§
{
   public class §_-qg§ extends §_-q4§
   {
      
      private static const §_-A3F§:int = 30000;
      
      public static var §_-a1b§:Object = {};
      
      public function §_-qg§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-Kh§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-a1b§[this.hero.id] = {"weight":§_-Nu§()};
         if(this.§_-41W§)
         {
            §_-a1b§[this.hero.id]["lifeTime"] = §_-A3F§;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete §_-a1b§[this.hero.id];
      }
   }
}

