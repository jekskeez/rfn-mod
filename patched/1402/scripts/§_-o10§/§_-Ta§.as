package §_-o10§
{
   public class §_-Ta§ extends §_-Vd§
   {
      
      public var scale:Number = 1;
      
      public function §_-Ta§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-u2t§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         if(this.§_-53U§)
         {
            this.scale = 1 + §_-bx§() / 100;
            this.hero.heroView.scale = this.scale;
         }
         else
         {
            this.hero.heroView.§_-67§(1 + §_-bx§() / 100);
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         if(this.§_-53U§)
         {
            this.scale = 1;
            this.hero.heroView.scale = this.scale;
         }
         else
         {
            this.hero.heroView.§_-67§(1);
         }
      }
   }
}

