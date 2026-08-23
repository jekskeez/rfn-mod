package §_-z2Z§
{
   import §_-I10§.§_-g2W§;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import views.§_-63X§;
   
   public class §_-TI§ extends §_-A3s§
   {
      
      private static const §_-r2u§:int = 95;
      
      private static const §_-R1K§:int = 100;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,10,6697728,true,null,null,null,null,"center");
      
      protected var icon:§_-63X§;
      
      public function §_-TI§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Nh§ = new ElementPackageBackSelected();
         this.§_-Nh§.width = §_-r2u§;
         this.§_-Nh§.height = §_-R1K§;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageBack();
         this.back.width = §_-r2u§;
         this.back.height = §_-R1K§;
         addChild(this.back);
         this.icon = new §_-63X§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = int((§_-r2u§ - this.icon.width) * 0.5);
         this.icon.y = §_-R1K§ - this.icon.height - 10;
         addChild(this.icon);
         var _loc1_:§_-22V§ = new §_-22V§(§_-g2W§.§_-224§(this.id),0,3,§_-i2c§);
         _loc1_.width = §_-r2u§;
         _loc1_.wordWrap = true;
         addChild(_loc1_);
      }
   }
}

