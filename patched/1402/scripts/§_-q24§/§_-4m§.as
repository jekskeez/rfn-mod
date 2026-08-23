package §_-q24§
{
   import §_-X1k§.§_-n1C§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import utils.§_-L14§;
   
   public class §_-4m§ extends §_-F2c§
   {
      
      public static const §_-pQ§:Array = [{
         "class":Balk1,
         "rotate":30
      },{
         "class":TrampolineView,
         "offsetX":34,
         "offsetY":13
      },{
         "class":PortalA,
         "offsetX":30,
         "offsetY":33
      },{
         "class":PortalB,
         "offsetX":30,
         "offsetY":33
      },{
         "class":Sight,
         "scale":1.5,
         "offsetX":17,
         "offsetY":18
      }];
      
      public function §_-4m§(param1:int)
      {
         super(param1);
      }
      
      override protected function get backWidth() : int
      {
         return 110;
      }
      
      override protected function get backHeight() : int
      {
         return 115;
      }
      
      override protected function §_-5N§() : void
      {
         this.§_-Oh§ = new ElementPackageBackSelectedGreen();
         this.§_-Oh§.width = this.backWidth;
         this.§_-Oh§.height = this.backHeight;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-Q1w§ = new §_-i5§(this.title,5,10,this.titleFormat);
         this.§_-Q1w§.width = this.backWidth - 10;
         this.§_-Q1w§.wordWrap = true;
         this.§_-Q1w§.selectable = false;
         addChild(this.§_-Q1w§);
         this.§_-Q1w§.y -= 7;
         this.image = new this.imageClass();
         if(Boolean(this.image) && this.image is MovieClip)
         {
            (this.image as MovieClip).gotoAndStop(0);
         }
         this.image.scaleX = this.image.scaleY = 1;
         this.image.x = int((this.backWidth - this.image.width) * 0.5);
         this.image.y = int((this.backHeight - this.image.height) * 0.5);
         addChild(this.image);
         this.§_-22u§();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-c10§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get title() : String
      {
         return §_-n1C§.§_-3f§(this.id);
      }
      
      override protected function get imageClass() : Class
      {
         return §_-n1C§.§_-92G§(this.id);
      }
      
      private function §_-22u§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:§_-L14§ = null;
         for each(_loc1_ in §_-pQ§)
         {
            if(this.image is _loc1_["class"])
            {
               if("offsetX" in _loc1_)
               {
                  this.image.x += _loc1_["offsetX"];
               }
               if("offsetY" in _loc1_)
               {
                  this.image.y += _loc1_["offsetY"];
               }
               if("scale" in _loc1_)
               {
                  this.image.scaleX = this.image.scaleY = this.image.scaleX * _loc1_["scale"];
               }
               if("rotate" in _loc1_)
               {
                  _loc2_ = new §_-L14§(this.image,new Point(this.image.x + int(this.image.width * 0.5),this.image.y + int(this.image.height * 0.5)));
                  _loc2_.§_-c2u§(_loc1_["rotate"]);
               }
            }
         }
      }
   }
}

