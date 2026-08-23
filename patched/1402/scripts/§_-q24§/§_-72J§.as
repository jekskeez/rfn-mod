package §_-q24§
{
   import tape.§_-2n§;
   import views.§_-Y2D§;
   
   public class §_-72J§ extends §_-2n§
   {
      
      protected var icon:§_-Y2D§;
      
      public function §_-72J§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Oh§ = new ElementPackageLargeBackSelected();
         this.§_-Oh§.width = 55;
         this.§_-Oh§.height = 55;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageLargeBack();
         this.back.width = 55;
         this.back.height = 55;
         addChild(this.back);
         this.icon = new §_-Y2D§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.2;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5) - 4;
         addChild(this.icon);
      }
   }
}

