package §_-z2V§
{
   import §_-X1k§.§_-P2x§;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import views.§_-v12§;
   
   public class §_-dM§ extends §_-2n§
   {
      
      private static const §_-B1t§:int = 95;
      
      private static const §_-u1l§:int = 100;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,10,6697728,true,null,null,null,null,"center");
      
      protected var icon:§_-v12§;
      
      public function §_-dM§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Oh§ = new ElementPackageBackSelected();
         this.§_-Oh§.width = §_-B1t§;
         this.§_-Oh§.height = §_-u1l§;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageBack();
         this.back.width = §_-B1t§;
         this.back.height = §_-u1l§;
         addChild(this.back);
         this.icon = new §_-v12§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = int((§_-B1t§ - this.icon.width) * 0.5);
         this.icon.y = §_-u1l§ - this.icon.height - 10;
         addChild(this.icon);
         var _loc1_:§_-i5§ = new §_-i5§(§_-P2x§.§_-d1E§(this.id),0,3,§_-W2P§);
         _loc1_.width = §_-B1t§;
         _loc1_.wordWrap = true;
         addChild(_loc1_);
      }
   }
}

