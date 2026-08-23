package §_-z2Z§
{
   import tape.§_-A3s§;
   import views.§_-W1y§;
   
   public class §_-O1D§ extends §_-A3s§
   {
      
      protected var icon:§_-W1y§;
      
      public function §_-O1D§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Nh§ = new ElementPackageLargeBackSelected();
         this.§_-Nh§.width = 60;
         this.§_-Nh§.height = 60;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageLargeBack();
         this.back.width = 60;
         this.back.height = 60;
         addChild(this.back);
         this.icon = new §_-W1y§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5) - 5;
         addChild(this.icon);
      }
   }
}

