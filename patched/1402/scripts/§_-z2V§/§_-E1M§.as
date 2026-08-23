package §_-z2V§
{
   import tape.§_-2n§;
   import views.§_-Y2D§;
   
   public class §_-E1M§ extends §_-2n§
   {
      
      protected var icon:§_-Y2D§;
      
      public function §_-E1M§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Oh§ = new ElementPackageLargeBackSelected();
         this.§_-Oh§.width = 60;
         this.§_-Oh§.height = 60;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageLargeBack();
         this.back.width = 60;
         this.back.height = 60;
         addChild(this.back);
         this.icon = new §_-Y2D§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5) - 5;
         addChild(this.icon);
      }
   }
}

