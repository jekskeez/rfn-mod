package §_-vK§
{
   public class §_-on§ extends §_-q4§
   {
      
      public var scale:Number = 1;
      
      public function §_-on§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-22p§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         if(this.§_-41W§)
         {
            this.scale = 1 + §_-Nu§() / 100;
            this.hero.heroView.scale = this.scale;
         }
         else
         {
            this.hero.heroView.§_-13a§(1 + §_-Nu§() / 100);
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         if(this.§_-41W§)
         {
            this.scale = 1;
            this.hero.heroView.scale = this.scale;
         }
         else
         {
            this.hero.heroView.§_-13a§(1);
         }
      }
   }
}

