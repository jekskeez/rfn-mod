package §_-A2j§
{
   import §_-I10§.§_-X2T§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import utils.§_-23z§;
   
   public class §_-FC§ extends §_-q2§
   {
      
      public static const §_-SI§:Array = [{
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
      
      public function §_-FC§(param1:int)
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
      
      override protected function §_-Cr§() : void
      {
         this.§_-Nh§ = new ElementPackageBackSelectedGreen();
         this.§_-Nh§.width = this.backWidth;
         this.§_-Nh§.height = this.backHeight;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-T1j§ = new §_-22V§(this.title,5,10,this.titleFormat);
         this.§_-T1j§.width = this.backWidth - 10;
         this.§_-T1j§.wordWrap = true;
         this.§_-T1j§.selectable = false;
         addChild(this.§_-T1j§);
         this.§_-T1j§.y -= 7;
         this.image = new this.imageClass();
         if(Boolean(this.image) && this.image is MovieClip)
         {
            (this.image as MovieClip).gotoAndStop(0);
         }
         this.image.scaleX = this.image.scaleY = 1;
         this.image.x = int((this.backWidth - this.image.width) * 0.5);
         this.image.y = int((this.backHeight - this.image.height) * 0.5);
         addChild(this.image);
         this.§_-8p§();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-F2z§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get title() : String
      {
         return §_-X2T§.§_-bh§(this.id);
      }
      
      override protected function get imageClass() : Class
      {
         return §_-X2T§.§_-D2L§(this.id);
      }
      
      private function §_-8p§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:§_-23z§ = null;
         for each(_loc1_ in §_-SI§)
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
                  _loc2_ = new §_-23z§(this.image,new Point(this.image.x + int(this.image.width * 0.5),this.image.y + int(this.image.height * 0.5)));
                  _loc2_.§_-84§(_loc1_["rotate"]);
               }
            }
         }
      }
   }
}

