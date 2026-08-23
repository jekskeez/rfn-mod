package §_-A2j§
{
   import tape.§_-A3s§;
   import views.§_-W1y§;
   
   public class §_-d1v§ extends §_-A3s§
   {
      
      protected var icon:§_-W1y§;
      
      public function §_-d1v§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Nh§ = new ElementPackageLargeBackSelected();
         this.§_-Nh§.width = 55;
         this.§_-Nh§.height = 55;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageLargeBack();
         this.back.width = 55;
         this.back.height = 55;
         addChild(this.back);
         this.icon = new §_-W1y§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.2;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5) - 4;
         addChild(this.icon);
      }
   }
}

